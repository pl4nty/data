-- Threat: !InfrastructureShared
-- Name: c957689cfc6
-- Type: 21

if pe.isdynamic_va(pevars.sigaddr) then
  mp.set_mpattribute("PEBMPAT:Simda:AntiEmuProcessName")
  pe.set_regval(pe.REG_EAX, 0)
end
return mp.CLEAN
