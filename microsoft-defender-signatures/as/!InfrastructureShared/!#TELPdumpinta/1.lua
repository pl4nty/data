-- Threat: !InfrastructureShared
-- Name: !#TEL:Pdumpint.a
-- Type: 13

if mp.get_mpattribute("HSTR:Pdumpint.A") then
  local l_0_0 = mp.getfilename()
  if string.find(l_0_0, "pd.exe") ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
