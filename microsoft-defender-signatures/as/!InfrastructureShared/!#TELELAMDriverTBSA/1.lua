-- Threat: !InfrastructureShared
-- Name: !#TEL:ELAMDriverTBS.A
-- Type: 10
-- MpAttributes: pea_isdriver & HSTR:ELAMDriver

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if peattributes.no_security == true then
  return mp.CLEAN
end

local function l_0_1()
  for l_1_0 = 1, pehdr.NumberOfSections do
    if tostring(pesecs[l_1_0].Name) == ".rsrc" then
      return pesecs[l_1_0].PointerToRawData, pesecs[l_1_0].VirtualAddress
    end
  end
end

local function l_0_2(l_2_0)
  local l_2_1 = mp.readfile(l_2_0, 20)
  local l_2_2 = mp.readu_u16(l_2_1, 15)
  local l_2_3 = mp.readu_u16(l_2_1, 13)
  local l_2_4 = l_2_0 + 16
  return l_2_2, l_2_3, l_2_4
end

local function l_0_3(l_3_0)
  local l_3_1 = mp.readfile(l_3_0, 8)
  local l_3_2 = mp.readu_u32(l_3_1, 1)
  local l_3_3 = mp.readu_u32(l_3_1, 5)
  local l_3_4 = mp.bitand(l_3_2, 2147483647)
  local l_3_5 = mp.bitand(l_3_2, 4294901760)
  local l_3_6 = mp.bitand(l_3_2, 65535)
  local l_3_7 = mp.shr32(mp.bitand(l_3_3, 2147483648), 31)
  local l_3_8 = mp.bitand(l_3_3, 2147483647)
  return l_3_2, l_3_3, l_3_4, l_3_5, l_3_6, l_3_7, l_3_8
end

local function l_0_4(l_4_0)
  local l_4_1 = mp.readfile(l_4_0, 20)
  local l_4_2 = mp.readu_u32(l_4_1, 1)
  local l_4_3 = mp.readu_u32(l_4_1, 5)
  local l_4_4 = mp.readu_u32(l_4_1, 9)
  local l_4_5 = mp.readu_u32(l_4_1, 13)
  return l_4_2, l_4_3, l_4_4, l_4_5
end

local l_0_5 = {
  E17764C39F2AFD7114F8528D2F9783D9A591F6679715EECE730A262CF5CFD3B3 = "62009aaabdae749fd47d19150958329bf6ff4b34",
  ["84D8717A416C8C9E214C6E0DBD091860D8133F413BCFF35673998F27BBA084CA"] = "b9eaa034c821c159b05d3521bcf7feb796ebd6ff",
  A08E79C386083D875014C409C13D144E0A24386132980DF11FF59737C8489EB1 = "007790f6561dad89b0bcd85585762495e358f8a5",
  ["4843A82ED3B1F2BFBEE9671960E1940C942F688D"] = "495847a93187cfb8c71f840cb7b41497ad95c64f",
  ["47F4B9898631773231B32844EC0D49990AC4EB1E"] = "409AA4A74A0CDA7C0FEE6BD0BB8823D16B5F1875"
}
mp.readprotection(false)
local l_0_6, l_0_7 = l_0_1()
local l_0_8, l_0_9, l_0_10 = l_0_2(l_0_6)
if l_0_9 == 0 then
  return mp.CLEAN
end
for l_0_11 = 0, l_0_9 do
  local l_0_12 = l_0_10 + l_0_11 * 8
  local l_0_13, l_0_14, l_0_15, l_0_16, l_0_17, l_0_18, l_0_19 = l_0_3(l_0_12)
  local l_0_20 = mp.readfile(l_0_6 + l_0_15, 40)
  l_0_20 = string.gsub(l_0_20, "%z", "")
  if string.find(l_0_20, "MSELAMCERTINFOID", 1, true) then
    mp.set_mpattribute("Lua:ELAMDriver")
    local l_0_21 = l_0_6 + l_0_19
    local l_0_22, l_0_23, l_0_24 = l_0_2(l_0_21)
    if l_0_23 == 0 then
      return mp.CLEAN
    end
    for l_0_25 = 0, l_0_23 do
      local l_0_26 = l_0_24 + l_0_25 * 8
      local l_0_27, l_0_28, l_0_29, l_0_30, l_0_31, l_0_32, l_0_33 = l_0_3(l_0_26)
      local l_0_34 = mp.readfile(l_0_6 + l_0_29, 70)
      l_0_34 = string.gsub(l_0_34, "%z", "")
      if string.find(l_0_34, "MICROSOFTELAMCERTIFICATEINFO", 1, true) then
        local l_0_35 = l_0_6 + l_0_33
        local l_0_36, l_0_37, l_0_38 = l_0_2(l_0_35)
        for l_0_39 = 0, l_0_36 do
          local l_0_40 = l_0_38 + l_0_39 * 8
          local l_0_41, l_0_42, l_0_43, l_0_44, l_0_45, l_0_46, l_0_47 = l_0_3(l_0_40)
          local l_0_48 = l_0_6 + l_0_47
          local l_0_49, l_0_50 = l_0_4(l_0_48)
          if l_0_50 <= 4000 and l_0_7 < l_0_49 then
            local l_0_51 = l_0_49 - l_0_7 + l_0_6
            local l_0_52 = mp.readfile(l_0_51, l_0_50)
            l_0_52 = string.gsub(l_0_52, "%z", "")
            for l_0_53 in pairs(l_0_5) do
              if l_0_52:match(l_0_53) ~= nil then
                mp.set_mpattribute("MpInternal_researchdata=TBSHash=" .. l_0_53)
                return mp.INFECTED
              end
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
