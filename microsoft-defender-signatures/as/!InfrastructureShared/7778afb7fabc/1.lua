-- Threat: !InfrastructureShared
-- Name: 7778afb7fabc
-- Type: 21
-- Flags: 1

if pehdr.SizeOfImage >= 327680 and pehdr.SizeOfImage <= 983040 or pehdr.SizeOfImage >= 2097152 and pehdr.SizeOfImage <= 3473408 then
  local l_0_0 = mp.GetHSTRCallerId()
  if l_0_0 == nil then
    return mp.CLEAN
  end
  if mp.HSTR_CALLER_SMS == l_0_0 then
    return mp.LOWFI
  end
  return mp.INFECTED
end
mp.changedetectionname(805306390)
return mp.SUSPICIOUS
