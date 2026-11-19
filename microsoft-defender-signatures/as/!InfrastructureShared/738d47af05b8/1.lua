-- Threat: !InfrastructureShared
-- Name: 738d47af05b8
-- Type: 21

if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("PUA:Block:GuiInject.A")
  return mp.INFECTED
end
return mp.LOWFI
