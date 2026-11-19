-- Threat: !InfrastructureShared
-- Name: 6540148673fc
-- Type: 21

if peattributes.isdll and not peattributes.no_exports then
  local l_0_0 = {
    ["rsasec.dll"] = true,
    ["secctp.dll"] = true,
    ["module_ls.dll"] = true,
    ["deploy.dll"] = true,
    ["deplay.dll"] = true,
    ["jpicom.dll"] = true,
    ["nbdcom.dll"] = true
  }
  local l_0_1 = string.lower(mp.getfilename(mp.FILEPATH_QUERY_FNAME))
  if l_0_1 and l_0_0[l_0_1] then
    return mp.INFECTED
  end
  local l_0_2 = pe.get_versioninfo()
  if l_0_2 then
    local l_0_3 = l_0_2.OriginalFilename
    if l_0_3 and l_0_0[string.lower(l_0_3)] then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
