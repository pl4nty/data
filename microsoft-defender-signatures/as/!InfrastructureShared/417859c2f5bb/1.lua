-- Threat: !InfrastructureShared
-- Name: 417859c2f5bb
-- Type: 21

mp.set_mpattribute("HSTR:Backdoor:Win64/Capybara.T")
if peattributes.isdll == false then
  return mp.INFECTED
end
local l_0_0, l_0_1, l_0_2
for l_0_3 = 1, pehdr.NumberOfSections do
  if tostring(pesecs[l_0_3].Name) == ".data" then
    l_0_0 = pesecs[l_0_3].VirtualAddress
    l_0_1 = pesecs[l_0_3].VirtualSize
    l_0_2 = l_0_3
    break
  end
end
if l_0_0 == nil then
  return mp.INFECTED
end
if l_0_1 == nil then
  return mp.INFECTED
end
local l_0_4 = 336
local l_0_5 = l_0_0 + l_0_4
local l_0_6 = 64
if not pe.contains_rva(l_0_2, l_0_5) then
  return mp.INFECTED
end
if not pe.contains_rva(l_0_2, l_0_5 + l_0_6) then
  return mp.INFECTED
end
if l_0_1 < l_0_6 + l_0_4 then
  return mp.INFECTED
end
mp.readprotection(false)
local l_0_7 = pe.mmap_rva(l_0_5, l_0_6)
local l_0_8 = mp.utf16to8(l_0_7)
if #l_0_8 < 4 then
  return mp.INFECTED
end
local l_0_9 = "HSTR:Backdoor:Win64/Capybara!" .. l_0_8
mp.set_mpattribute(l_0_9)
return mp.INFECTED
