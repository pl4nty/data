-- Threat: !InfrastructureShared
-- Name: 2a78bc0b3ac7
-- Type: 21

if not peattributes.isvbnative and not peattributes.isvbpcode then
  return mp.CLEAN
end
if hstrlog[1].matched then
  local l_0_0 = hstrlog[1].VA
  local l_0_1 = "HSTR:VirTool:Win32/VBInject.gen!LM_ptr_" .. string.format("%.08x", l_0_0 + 62)
  mp.set_mpattribute(l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
