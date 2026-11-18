-- Threat: !InfrastructureShared
-- Name: 34788bb09541
-- Type: 21

if peattributes.isdll == true then
  local l_0_0, l_0_1 = pe.get_exports()
  if l_0_0 == 1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
