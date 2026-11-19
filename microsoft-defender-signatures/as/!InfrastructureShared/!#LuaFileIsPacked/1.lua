-- Threat: !InfrastructureShared
-- Name: !#Lua:FileIsPacked
-- Type: 10

if mp.ispackedwith("UPX_+") or mp.ispackedwith("UPX+") then
  mp.set_mpattribute("Lua:FileIsPackedWithUPX")
end
if peattributes.packersigmatched then
  mp.set_mpattribute("Lua:FileIsPackedWithPackerSigMatched")
end
if peattributes.packed then
  return mp.INFECTED
end
return mp.CLEAN
