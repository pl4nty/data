-- Threat: !InfrastructureShared
-- Name: !#Base64MZWithPipe
-- Type: 13
-- MpAttributes: SCPT:Base64MZWithPipe

if mp.getfilesize() < 1048576 then
  mp.readprotection(false)
  local l_0_0 = mp.readfile(0, mp.getfilesize())
  if l_0_0:find("TV[pq]QAA[IM]AAAAE") ~= 1 then
    return mp.CLEAN
  end
  local l_0_1 = l_0_0:gsub("([A-Za-z0-9+/=]+)(|)", "%1")
  mp.vfo_add_buffer(l_0_1, "[B64Strpd]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
end
return mp.CLEAN
