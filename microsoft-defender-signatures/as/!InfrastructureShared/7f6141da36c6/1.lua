-- Threat: !InfrastructureShared
-- Name: 7f6141da36c6
-- Type: 21

if peattributes.ismsil then
  local l_0_0 = pe.get_versioninfo()
  if l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_1 = {
    "KnowBe4 Ransomware Simulator"
  }
  for l_0_2 = 1, #l_0_1 do
    if l_0_0.ProductName == l_0_1[l_0_2] then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
