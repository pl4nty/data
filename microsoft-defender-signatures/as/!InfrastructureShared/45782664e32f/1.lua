-- Threat: !InfrastructureShared
-- Name: 45782664e32f
-- Type: 21
-- Flags: 1

if peattributes.hasstandardentry == true or pehdr.Subsystem == 1 then
  return mp.CLEAN
end
if mp.HSTR_WEIGHT >= 10 then
  return mp.SUSPICIOUS
end
local l_0_0 = hstrlog[3].matched and hstrlog[4].matched and hstrlog[5].matched and hstrlog[6].matched
if peattributes.reads_vdll_code and l_0_0 then
  return mp.LOWFI
end
return mp.CLEAN
