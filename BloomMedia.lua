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
	font	= [[Interface\AddOns\BloomMedia\Fonts\]],
	sound	= [[Interface\AddOns\BloomMedia\Sounds\]],
	emoji	= [[Interface\AddOns\BloomMedia\ChatEmojis\]],
	logo	= [[Interface\AddOns\BloomMedia\ChatLogos\]],
	texture	= [[Interface\AddOns\BloomMedia\Textures\]]
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
    	AddMedia("sound", sound .. ".ogg", "" .. sound .. "")
    end
end

AddMedia("sound", "gn-girl-1.ogg", "goodnight girl 1")
AddMedia("sound", "gn-girl-2.ogg", "goodnight girl 2")
AddMedia("sound", "donz-breath.ogg", "breath donz")
AddMedia("sound", "nishi-breath.ogg", "breath nishi")
AddMedia("sound", "josh-breath.ogg", "breath josh")
AddMedia("sound", "lorgok-noo.ogg", "sad boomkin")
AddMedia("sound", "beans-wtf.ogg", "beans wtf")
AddMedia("sound", "puuker.ogg", "puuker")