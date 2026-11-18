-- Threat: Rogue:Win32/FakeSmoke
-- Type: 8

if peattributes.hasappendeddata ~= true then
  return mp.CLEAN
end
if peattributes.isdll ~= true then
  return mp.CLEAN
end
if footerpage[3988] ~= 0 then
  return mp.CLEAN
end
if footerpage[3989] ~= 0 then
  return mp.CLEAN
end
if footerpage[3990] ~= 0 then
  return mp.CLEAN
end
if footerpage[3991] ~= 0 then
  return mp.CLEAN
end
if footerpage[3992] ~= 119 then
  return mp.CLEAN
end
if footerpage[3993] ~= 102 then
  return mp.CLEAN
end
if footerpage[3994] ~= 68 then
  return mp.CLEAN
end
if footerpage[3995] ~= 85 then
  return mp.CLEAN
end
local l_0_0 = mp.bitxor(mp.readu_u32(footerpage, 3996), mp.readu_u32(footerpage, 4096))
if l_0_0 ~= 0 then
  return mp.CLEAN
end
return mp.INFECTED
