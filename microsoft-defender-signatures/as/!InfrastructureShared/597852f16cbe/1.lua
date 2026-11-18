-- Threat: !InfrastructureShared
-- Name: 597852f16cbe
-- Type: 21

if peattributes.isexe and peattributes.is_delphi then
  return mp.INFECTED
end
return mp.CLEAN
