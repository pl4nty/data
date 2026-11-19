-- Threat: !InfrastructureShared
-- Name: 1c6102c74bbf
-- Type: 21

if peattributes.isexe and mp.get_mpattribute("SIGATTR:DelphiFile") then
  local l_0_0 = hstrlog[1].hitcount
  if 10 < l_0_0 then
    mp.set_mpattribute("HSTR:DelphiPacker.DummyCallsGT10")
  end
  if 20 < l_0_0 then
    mp.set_mpattribute("HSTR:DelphiPacker.DummyCallsGT20")
  else
    mp.set_mpattribute("HSTR:DelphiPacker.DummyCallsLE20")
  end
  if 30 < l_0_0 then
    mp.set_mpattribute("HSTR:DelphiPacker.DummyCallsGT30")
  else
    mp.set_mpattribute("HSTR:DelphiPacker.DummyCallsLE30")
  end
end
return mp.CLEAN
