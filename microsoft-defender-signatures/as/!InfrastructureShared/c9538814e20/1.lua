-- Threat: !InfrastructureShared
-- Name: c9538814e20
-- Type: 21

if pe.isdynamic_va(pevars.sigaddr) then
  mp.set_mpattribute("PEBMPAT:Simda:AntiEmuProcessName")
  pe.set_regval(pe.REG_EAX, 0)
end
return mp.CLEAN
