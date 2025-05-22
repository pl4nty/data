-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a669_803.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1.image_path)
if l_0_2 == nil then
  return mp.CLEAN
end
if not l_0_2:find("\\explorer.exe") then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_3 or #l_0_3 <= 60 then
  return mp.CLEAN
end
local l_0_4 = (string.match)(l_0_3, "replace%(%\'(.-)%\'")
if l_0_4 == nil or #l_0_4 ~= 1 then
  return mp.CLEAN
end
local l_0_5 = (string.gsub)(l_0_3, "%" .. l_0_4, "")
local l_0_6 = (string.lower)(l_0_5)
if (string.find)(l_0_6, "curl", 1, true) and (string.find)(l_0_6, "http", 1, true) and ((string.find)(l_0_6, "iex", 1, true) or (string.find)(l_0_6, "invoke-expression", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN

