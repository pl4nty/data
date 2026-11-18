-- Threat: !InfrastructureShared
-- Name: !#Lua:CloudCredTheft.DeepStrings.A
-- Type: 10
-- Includes: ResearchData, BMLuaLib
-- MpAttributes: (BM_UnsignedDll) & (pea_hasexports)

local l_0_0 = mp.getfilesize()
if isnull(l_0_0) or l_0_0 == 0 then
  return mp.CLEAN
end
if l_0_0 < 5242880 then
  return mp.CLEAN
end
if isnull(pehdr) or isnull(pehdr.NumberOfSections) then
  return mp.CLEAN
end
local l_0_1 = 536870912
local l_0_2 = 3145728
local l_0_3 = false
local l_0_4 = false
local l_0_5 = false
local l_0_6 = false
local l_0_7 = false
for l_0_8 = 1, pehdr.NumberOfSections do
  if l_0_2 <= 0 then
    break
  end
  local l_0_9 = pesecs[l_0_8]
  if not isnull(l_0_9) and not isnull(l_0_9.PointerToRawData) and not isnull(l_0_9.SizeOfRawData) and 0 < l_0_9.SizeOfRawData then
    local l_0_10 = false
    if not isnull(l_0_9.Characteristics) then
      l_0_10 = mp.bitand(l_0_9.Characteristics, l_0_1) ~= 0
    end
    local l_0_11 = l_0_9.SizeOfRawData
    if l_0_2 < l_0_11 then
      l_0_11 = l_0_2
    end
    if not l_0_10 and l_0_0 >= l_0_9.PointerToRawData + l_0_11 then
      mp.readprotection(false)
      local l_0_12 = mp.readfile(l_0_9.PointerToRawData, l_0_11)
      mp.readprotection(true)
      if not isnull(l_0_12) then
        l_0_12 = tostring(l_0_12)
        l_0_2 = l_0_2 - l_0_11
        if string.find(l_0_12, "169.254.169.254", 1, true) then
          l_0_3 = true
        end
        if string.find(l_0_12, "/latest/meta-data/iam/security-credentials/", 1, true) then
          l_0_4 = true
        end
        if string.find(l_0_12, "age-encryption.org/v1", 1, true) then
          l_0_5 = true
        end
        if string.find(l_0_12, "\\rust-s3-", 1, true) then
          l_0_6 = true
        end
        if string.find(l_0_12, "\\aws-creds-", 1, true) then
          l_0_7 = true
        end
      end
    end
  end
end
local l_0_13 = 0
if l_0_5 then
  l_0_13 = l_0_13 + 1
end
if l_0_6 then
  l_0_13 = l_0_13 + 1
end
if l_0_7 then
  l_0_13 = l_0_13 + 1
end
local l_0_14 = false
if l_0_3 and l_0_4 then
  mp.set_mpattribute("Lua:CloudCredTheft.Imds.A")
  l_0_14 = true
end
if 2 <= l_0_13 then
  mp.set_mpattribute("Lua:CloudCredTheft.ExfilStack.A")
  l_0_14 = true
end
if not l_0_14 then
  return mp.CLEAN
end
set_research_data("cct_size", tostring(l_0_0), false)
set_research_data("cct_crates", tostring(l_0_13), false)
return mp.INFECTED
