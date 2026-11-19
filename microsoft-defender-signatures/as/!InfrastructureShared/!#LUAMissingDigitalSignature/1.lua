-- Threat: !InfrastructureShared
-- Name: !#LUA:MissingDigitalSignature
-- Type: 8

if pehdr.DataDirectory[5].RVA <= 0 then
  return mp.CLEAN
end
if 0 >= pehdr.DataDirectory[5].Size then
  return mp.CLEAN
end
if pehdr.DataDirectory[5].RVA >= mp.getfilesize() then
  return mp.INFECTED
end
mp.readprotection(false)
if pehdr.DataDirectory[5].RVA + 9 >= mp.getfilesize() then
  return mp.INFECTED
end
local l_0_0 = mp.readfile(pehdr.DataDirectory[5].RVA, 9)
if mp.readu_u32(l_0_0, 5) ~= 131584 then
  return mp.CLEAN
end
if l_0_0:byte(9) ~= 48 then
  return mp.CLEAN
end
if pehdr.DataDirectory[5].RVA + pehdr.DataDirectory[5].Size > mp.getfilesize() then
  return mp.INFECTED
end
return mp.CLEAN
