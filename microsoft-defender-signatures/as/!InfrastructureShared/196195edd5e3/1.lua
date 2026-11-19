-- Threat: !InfrastructureShared
-- Name: 196195edd5e3
-- Type: 21

if pehdr.Subsystem ~= 1 and pehdr.DataDirectory[1].Size < 256 then
  local l_0_0 = string.lower(mp.getfilename())
  if l_0_0 ~= nil and l_0_0:find("\\system", 1, true) == nil and l_0_0:find("program files", 1, true) == nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
