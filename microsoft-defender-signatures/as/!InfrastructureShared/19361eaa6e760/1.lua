-- Threat: !InfrastructureShared
-- Name: 19361eaa6e760
-- Type: 21

local l_0_0 = mp.getfilesize()
local l_0_1 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_DEBUG].Size
if peattributes.no_security == true and 32768 <= l_0_0 and l_0_0 <= 655360 and (56 <= l_0_1 or l_0_1 >= pehdr.SizeOfImage) then
  return mp.INFECTED
end
return mp.CLEAN
