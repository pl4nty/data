-- Threat: !InfrastructureShared
-- Name: c95bf8f40c2
-- Type: 21

if pe.isdynamic_va(pevars.sigaddr) then
  local l_0_0 = pe.get_regval(pe.REG_EAX)
  if l_0_0 == 1247748109 then
    mp.set_mpattribute("PEBMPAT:AntiEmuVirtualProtectLayout")
    pe.set_regval(pe.REG_EAX, 3047219186)
  end
end
return mp.CLEAN
