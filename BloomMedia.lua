local A = ...
local LSM = LibStub("LibSharedMedia-3.0")

local E, L, V, P, G = unpack(ElvUI or {}); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB

local MediaKey = {
	font	= 'Fonts',
	sound	= 'Sounds',
	emoji	= 'ChatEmojis',
	logo	= 'ChatLogos',
	texture	= 'Textures'
}

local MediaPath = {
	font	= [[Interface\AddOns\WaitMedia\Fonts\]],
	sound	= [[Interface\AddOns\WaitMedia\Sounds\]],
	emoji	= [[Interface\AddOns\WaitMedia\ChatEmojis\]],
	logo	= [[Interface\AddOns\WaitMedia\ChatLogos\]],
	texture	= [[Interface\AddOns\WaitMedia\Textures\]]
}

local function AddMedia(Type, File, Name, CustomType, Mask)
	local path = MediaPath[Type]
	if path then
		local key = File:gsub('%.%w-$','')
		local file = path .. File

		local pathKey = MediaKey[Type]
		if pathKey and E then
			E.Media[pathKey][key] = file
		end

		if Name then -- Register to LSM
			local nameKey = (Name == true and key) or Name
			if type(CustomType) == 'table' then
				for _, name in ipairs(CustomType) do
					LSM:Register(name, nameKey, file, Mask)
				end
			else
				LSM:Register(CustomType or Type, nameKey, file, Mask)
			end
		end
	end
end

AddMedia('font','Expressway.ttf', true)
AddMedia('font','RobotoBold.ttf', true)
AddMedia('font','RobotoRegular.ttf', true)

AddMedia('font','OpenSans-Regular.ttf', 'OpenSans')
AddMedia('font','OpenSans-SemiBold.ttf', 'OpenSans SemiBold')
AddMedia('font','OpenSans-Bold.ttf', 'OpenSans Bold')
AddMedia('font','OpenSans-ExtraBold.ttf', 'OpenSans ExtraBold')

AddMedia('font','Poppins-Regular.ttf', 'Poppins')
AddMedia('font','Poppins-SemiBold.ttf', 'Poppins SemiBold')
AddMedia('font','Poppins-Bold.ttf', 'Poppins Bold')
AddMedia('font','Poppins-ExtraBold.ttf', 'Poppins ExtraBold')

AddMedia('font','Lato-Regular.ttf', 'Poppins')
AddMedia('font','Lato-SemiBold.ttf', 'Lato SemiBold')
AddMedia('font','Lato-Bold.ttf', 'Lato Bold')

local sounds = {
	"Back-left",
	"Back-right",
	"Back",
	"Barrier",
	"Breath",
	"Dodge",
	"Front-left",
	"Front-right",
	"Front",
	"Frontal",
	"Go",
	"Grip",
	"Help",
	"Left",
	"Ramp",
	"Rewind",
	"Right",
	"Shield",
	"Stop"
}

do
    for i, sound in ipairs(sounds) do
    	AddMedia("sound", sound .. ".ogg", "|cFF1E90FF~ " .. sound .. "|r")
    end
end