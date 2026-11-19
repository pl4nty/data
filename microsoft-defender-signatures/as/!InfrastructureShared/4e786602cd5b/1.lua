-- Threat: !InfrastructureShared
-- Name: 4e786602cd5b
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:Win32/DelphiFile") then
  return mp.INFECTED
end
return mp.CLEAN
