-- Threat: !InfrastructureShared
-- Name: !#Lua:ShortcutClassifierA
-- Type: 24
-- Includes: SetAttributeFromClassifierScoresEx
-- MpAttributes: RPF:ShortcutClassifierA & MpNewlyCreatedHint & !Lua:LnkExclusions

if mp.get_mpattribute("Lua:LastFolder1!programs") and mp.get_mpattribute("Lua:LastFolder2!start/x20menu") and mp.get_mpattribute("Lua:LastFolder3!windows") and mp.get_mpattribute("Lua:LastFolder4!microsoft") and mp.get_mpattribute("Lua:LastFolder5!roaming") then
  return mp.CLEAN
end
if mp.get_mpattribute("Lua:LastFolder2!programs") and mp.get_mpattribute("Lua:LastFolder3!start/x20menu") and mp.get_mpattribute("Lua:LastFolder4!windows") and mp.get_mpattribute("Lua:LastFolder5!microsoft") and mp.get_mpattribute("Lua:LastFolder6!roaming") then
  return mp.CLEAN
end
local l_0_0 = mp.get_mpattributevalue("RPF:ShortcutClassifierA")
if l_0_0 ~= nil then
  local l_0_1 = {
    100,
    95,
    90,
    80,
    70,
    60
  }
  SetAttributeFromClassifierScoresEx(l_0_0, l_0_1, "Lua:ShortcutClassifierA:")
end
return mp.CLEAN
