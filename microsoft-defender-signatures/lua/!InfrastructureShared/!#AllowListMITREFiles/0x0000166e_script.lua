-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#AllowListMITREFiles\0x0000166e_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetMOTWHostUrl)()
if l_0_0 ~= nil and l_0_0 ~= "" then
  l_0_0 = l_0_0:lower()
  if (string.find)(l_0_0, "https://attack.mitre.org", 1, true) ~= nil or (string.find)(l_0_0, "https://github.com/mitre/cti/blob", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN

