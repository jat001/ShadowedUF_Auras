if( GetLocale() ~= "zhTW" ) then return end
local L = {}

local ns = select(2, ...)
ns.L = setmetatable(L, {__index = ns.L})
