-- Threat: !InfrastructureShared
-- Name: PeParser
-- Type: 1

function Version_to_str(l_1_0)
  local l_1_1 = crypto.shr64(l_1_0, 48)
  
  local l_1_2 = crypto.bitand(crypto.shr64(l_1_0, 32), 65535)
  local l_1_3 = crypto.bitand(crypto.shr64(l_1_0, 16), 65535)
  local l_1_4 = crypto.bitand(l_1_0, 65535)
  return tostring(l_1_1) .. "." .. tostring(l_1_2) .. "." .. tostring(l_1_3) .. "." .. tostring(l_1_4)
end

function GetSectionInfoOfVirtualAddress(l_2_0)
  if l_2_0 == nil or pehdr == nil or pehdr.NumberOfSections == nil or pehdr.NumberOfSections == 0 or pesecs == nil then
    return nil
  end
  local l_2_1 = pehdr.ImageBase
  for l_2_2 = 1, pehdr.NumberOfSections do
    local l_2_3 = pesecs[l_2_2].VirtualAddress
    local l_2_4 = pesecs[l_2_2].VirtualSize
    local l_2_5 = l_2_1 + l_2_3
    local l_2_6 = l_2_5 + l_2_4
    if l_2_0 >= l_2_5 and l_2_0 <= l_2_6 then
      local l_2_7 = pesecs[l_2_2].Name
      return l_2_2, l_2_7, l_2_3, l_2_4
    end
  end
end
