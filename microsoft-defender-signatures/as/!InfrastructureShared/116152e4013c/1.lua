-- Threat: !InfrastructureShared
-- Name: 116152e4013c
-- Type: 21

if pe.isdynamic_va(hstrlog[1].VA) then
  return mp.SYNCLOWFI
end
return mp.LOWFI
