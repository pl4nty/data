-- Threat: !InfrastructureShared
-- Name: !#LUA:TinyEPsec
-- Type: 10
-- MpAttributes: MpHasExpensiveLoop

if pevars.epsec == 1 and pesecs[1].SizeOfRawData == 1024 then
  if peattributes.isdll then
    return mp.CLEAN
  end
  return mp.LOWFI
end
return mp.CLEAN
