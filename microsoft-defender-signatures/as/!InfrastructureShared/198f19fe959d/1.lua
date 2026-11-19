-- Threat: !InfrastructureShared
-- Name: 198f19fe959d
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1, l_0_2 = string.match(l_0_0, "(.*)%.(%a+)->%w+/%w+.bin$")
if l_0_1 == nil or l_0_2 == nil then
  l_0_1 = l_0_0
else
  l_0_1 = l_0_1 .. "." .. l_0_2
end
l_0_1 = MpCommon.PathToWin32Path(l_0_1)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, ".:\\program files %(x86%)\\blp\\api\\office tools\\") ~= nil then
  return mp.CLEAN
end
return mp.INFECTED
