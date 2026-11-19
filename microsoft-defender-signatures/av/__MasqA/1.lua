-- Threat: \xd8\xa1Masq.A
-- Type: 35
-- MpAttributes: (BM_ELF_EXEC_FILE | BM_ELF_DYN_FILE) & RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 and 5 <= #l_0_0 and l_0_0:sub(-5) == " .pdf" then
  return mp.INFECTED
end
return mp.CLEAN
