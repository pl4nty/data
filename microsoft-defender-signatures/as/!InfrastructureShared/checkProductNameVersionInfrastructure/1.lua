-- Threat: !InfrastructureShared
-- Name: checkProductNameVersionInfrastructure
-- Type: 1

function checkProductName(l_1_0)
  local l_1_1 = string.lower(l_1_0)
  
  local l_1_2 = pe.get_versioninfo().ProductName
  if l_1_2 == nil then
    return false
  end
  local l_1_3 = string.gsub(l_1_2, "%s+$", "")
  local l_1_4 = string.lower(l_1_3)
  if l_1_1 == l_1_4 then
    return true
  end
  return false
end

function gencheckProductName(l_2_0, l_2_1)
  local l_2_2 = string.lower(l_2_1)
  local l_2_3 = l_2_0
  local l_2_4 = string.gsub(pe.get_versioninfo().ProductName, "%s+$", "")
  local l_2_5 = string.lower(l_2_4)
  local l_2_6 = string.match(l_2_5, "^%w+")
  local l_2_7 = string.match(l_2_5, "^%w+%s%w+")
  local l_2_8 = string.match(l_2_5, "%w+$")
  local l_2_9 = {
    EQ = "exactmatch",
    FIRSTWORD = "firstword",
    FIRSTTWO = "firsttwo",
    LASTWORD = "lastword"
  }
  if l_2_2 == l_2_5 and l_2_9[l_2_3] == "exactmatch" then
    return true
  elseif l_2_2 == l_2_6 and l_2_9[l_2_3] == "firstword" then
    return true
  elseif l_2_2 == l_2_7 and l_2_9[l_2_3] == "firsttwo" then
    return true
  elseif l_2_2 == l_2_8 and l_2_9[l_2_3] == "lastword" then
    return true
  end
  return false
end

function compareProductVersion(l_3_0, l_3_1)
  local l_3_2 = {}
  local l_3_3 = {}
  for l_3_4 in string.gmatch(l_3_0, "%d+") do
    table.insert(l_3_2, tonumber(l_3_4))
  end
  for l_3_5 in string.gmatch(l_3_1, "%d+") do
    table.insert(l_3_3, tonumber(l_3_5))
  end
  if #l_3_2 ~= #l_3_3 then
    return nil
  end
  if l_3_2 == l_3_3 then
    return 0
  end
  for l_3_6 = 1, #l_3_2 do
    if l_3_2[l_3_6] < l_3_3[l_3_6] then
      return -1
    elseif l_3_2[l_3_6] > l_3_3[l_3_6] then
      return 1
    end
  end
  return 0
end

function checkProductVersion(l_4_0, l_4_1)
  local l_4_2 = pe.get_versioninfo()
  if l_4_2 == nil then
    return nil
  end
  local l_4_3 = string.gsub(l_4_2.ProductVersion, "%s+$", "")
  local l_4_4 = compareProductVersion(l_4_3, l_4_1)
  if l_4_0 == "EQ" and l_4_4 == 0 then
    return true
  elseif l_4_0 == "GT" and 0 < l_4_4 then
    return true
  elseif l_4_0 == "GTE" and 0 <= l_4_4 then
    return true
  elseif l_4_0 == "LT" and l_4_4 < 0 then
    return true
  elseif l_4_0 == "LTE" and l_4_4 <= 0 then
    return true
  elseif l_4_4 == nil then
    return nil
  end
  return false
end

function checkFileVersion(l_5_0, l_5_1)
  local l_5_2 = pe.get_versioninfo()
  if l_5_2 == nil then
    return nil
  end
  local l_5_3 = string.gsub(l_5_2.FileVersion, "%s+$", "")
  local l_5_4 = compareProductVersion(l_5_3, l_5_1)
  if l_5_0 == "EQ" and l_5_4 == 0 then
    return true
  elseif l_5_0 == "GT" and 0 < l_5_4 then
    return true
  elseif l_5_0 == "GTE" and 0 <= l_5_4 then
    return true
  elseif l_5_0 == "LT" and l_5_4 < 0 then
    return true
  elseif l_5_0 == "LTE" and l_5_4 <= 0 then
    return true
  elseif l_5_4 == nil then
    return nil
  end
  return false
end

function IsProductNameBlank()
  local l_6_0 = pe.get_versioninfo().ProductName
  if l_6_0 == nil then
    return true
  end
  return false
end
