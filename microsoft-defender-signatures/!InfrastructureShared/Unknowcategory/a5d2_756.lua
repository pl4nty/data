-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a5d2_756.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  for l_1_4 = 1, #l_1_0 do
    local l_1_5 = l_1_0:byte(l_1_4)
    if (l_1_5 >= 194 and l_1_5 <= 207) or l_1_5 >= 208 and l_1_5 <= 211 then
      return true
    end
  end
  return false
end

local l_0_1 = (mp.GetScannedPPID)()
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (mp.GetProcessCommandLine)(l_0_1)
if not l_0_2 then
  return mp.CLEAN
end
if #l_0_2 < 50 then
  return mp.CLEAN
end
local l_0_3 = (mp.GetParentProcInfo)()
if l_0_3 == nil or l_0_3.image_path == nil then
  return mp.CLEAN
end
local l_0_4 = (string.lower)(l_0_3.image_path)
if l_0_4:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
if l_0_0(l_0_2) then
  return mp.INFECTED
end
if (mp.get_mpattribute)("MpCmdLineFoundB64") then
  return mp.INFECTED
end
return mp.CLEAN

