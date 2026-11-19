-- Threat: !InfrastructureShared
-- Name: !#Lua:SamSamTools
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH))
  local l_0_2 = string.lower(string.sub(l_0_0, 1, 11))
  if l_0_2 ~= "\\\\tsclient\\" then
    return mp.CLEAN
  end
  mp.set_mpattribute("Lua:RDPProcExec")
  if string.lower(l_0_1) == "worker.exe" then
    mp.set_mpattribute("Lua:SamSamWorker")
    return mp.INFECTED
  end
  local l_0_3 = string.lower(string.sub(l_0_0, 12, 20))
  local l_0_4 = {
    kali = 1,
    kalilinux = 1,
    pencha = 1,
    sila = 1,
    pendekar = 1,
    pende5 = 1,
    ["b\\sqll"] = 2,
    ["b\\sql"] = 2,
    ["b\\01"] = 2,
    ["b\\1"] = 2
  }
  if l_0_4[l_0_3] == 1 then
    mp.set_mpattribute("Lua:SamSamMachine")
    return mp.INFECTED
  elseif l_0_4[l_0_3] == 2 then
    mp.set_mpattribute("Lua:SamSamPpl")
    return mp.INFECTED
  end
end
return mp.CLEAN
