-- Threat: !InfrastructureShared
-- Name: 41b382b2693c
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
local l_0_1 = string.lower(mp.utf16to8(this_sigattrlog[3].wp1))
if l_0_0 == l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
