-- Threat: !InfrastructureShared
-- Name: 33786d2cb16a
-- Type: 21

local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 < 92 then
  return mp.CLEAN
end
local l_0_2 = mp.GetCertificateInfo()
for l_0_3, l_0_4 in pairs(l_0_2) do
  if l_0_4.Signers ~= nil then
    return mp.CLEAN
  end
end
local l_0_5 = 0
for l_0_6 = 1, l_0_0 do
  local l_0_7 = pe.mmap_string_rva(l_0_1[l_0_6].namerva, 64)
  if string.find(l_0_7, "cJSON", 1, true) then
    l_0_5 = l_0_5 + 1
  end
end
if l_0_5 < 92 then
  return mp.CLEAN
end
local l_0_8 = 0
local l_0_9 = 0
local l_0_10 = 0
local l_0_11 = 0
for l_0_12 = 1, pehdr.NumberOfSections do
  local l_0_13 = pesecs[l_0_12].Name
  if l_0_13 == ".text" then
    l_0_8 = l_0_12
  elseif l_0_13 == ".rdata" then
    l_0_9 = l_0_12
  elseif l_0_13 == ".data" then
    l_0_10 = l_0_12
  elseif string.find(l_0_13:lower(), "vmp", 1, true) then
    l_0_11 = l_0_12
  end
end
if l_0_8 == 0 or l_0_9 == 0 or l_0_10 == 0 or l_0_11 ~= 0 then
  return mp.CLEAN
end
local l_0_14 = pesecs[l_0_8].SizeOfRawData
local l_0_15 = pesecs[l_0_9].SizeOfRawData
local l_0_16 = pesecs[l_0_10].SizeOfRawData
if l_0_14 == 0 and l_0_15 == 0 and l_0_16 == 0 then
  return mp.INFECTED
end
return mp.CLEAN
