-- Threat: \xb0!Demmo.3253
-- Type: 8

if peattributes.lastscn_writable == false then
  return mp.CLEAN
end
if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
if peattributes.lastscn_valign == false then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 39) ~= 27716 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 41) ~= 25185 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData <= 3253 then
  return mp.CLEAN
end
local l_0_0 = {
  {
    sig = "\156`\232\000\000\000\000]\139|$$\185\005\000\000\000+\249\137|$$\141\181\164\f\000\000\243\164\141",
    xray_type = 0,
    bytes_to_decrypt = 0
  }
}
return pe.xray_block(l_0_0, 1, -1, 0, -1)
