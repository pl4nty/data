-- Threat: !InfrastructureShared
-- Name: 1f5b39185e266
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = versioning.GetOrgID()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {
  ["26e8b179-9fbe-40fd-8f34-37cdee8c4766"] = true,
  ["e6e2b814-cd64-4ac3-9e16-91753ff30617"] = true,
  ["bcfa1838-fccc-4999-9d5b-5ec1ac1a4776"] = true,
  ["9ee8ddb9-e98f-4b86-a160-fe3b96f39cc6"] = true
}
if not l_0_1[string.lower(l_0_0)] then
  return mp.CLEAN
end
if not this_sigattrlog[2].matched then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4
if this_sigattrlog[3].matched and not isnull(this_sigattrlog[3].utf8p1) and not isnull(this_sigattrlog[3].utf8p2) then
  l_0_2, l_0_3, l_0_4 = "cmd.exe", this_sigattrlog[3].utf8p1, this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and not isnull(this_sigattrlog[4].utf8p1) and not isnull(this_sigattrlog[4].utf8p2) then
  l_0_2, l_0_3, l_0_4 = "powershell.exe", this_sigattrlog[4].utf8p1, this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and not isnull(this_sigattrlog[5].utf8p1) and not isnull(this_sigattrlog[5].utf8p2) then
  l_0_2, l_0_3, l_0_4 = "pwsh.exe", this_sigattrlog[5].utf8p1, this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and not isnull(this_sigattrlog[6].utf8p1) and not isnull(this_sigattrlog[6].utf8p2) then
  l_0_2, l_0_3, l_0_4 = "mshta.exe", this_sigattrlog[6].utf8p1, this_sigattrlog[6].utf8p2
elseif this_sigattrlog[7].matched and not isnull(this_sigattrlog[7].utf8p1) and not isnull(this_sigattrlog[7].utf8p2) then
  l_0_2, l_0_3, l_0_4 = "certutil.exe", this_sigattrlog[7].utf8p1, this_sigattrlog[7].utf8p2
elseif this_sigattrlog[8].matched and not isnull(this_sigattrlog[8].utf8p1) and not isnull(this_sigattrlog[8].utf8p2) then
  l_0_2, l_0_3, l_0_4 = "bitsadmin.exe", this_sigattrlog[8].utf8p1, this_sigattrlog[8].utf8p2
elseif this_sigattrlog[9].matched and not isnull(this_sigattrlog[9].utf8p1) and not isnull(this_sigattrlog[9].utf8p2) then
  l_0_2, l_0_3, l_0_4 = "wscript.exe", this_sigattrlog[9].utf8p1, this_sigattrlog[9].utf8p2
elseif this_sigattrlog[10].matched and not isnull(this_sigattrlog[10].utf8p1) and not isnull(this_sigattrlog[10].utf8p2) then
  l_0_2, l_0_3, l_0_4 = "cscript.exe", this_sigattrlog[10].utf8p1, this_sigattrlog[10].utf8p2
elseif this_sigattrlog[11].matched and not isnull(this_sigattrlog[11].utf8p1) and not isnull(this_sigattrlog[11].utf8p2) then
  l_0_2, l_0_3, l_0_4 = "rundll32.exe", this_sigattrlog[11].utf8p1, this_sigattrlog[11].utf8p2
elseif this_sigattrlog[12].matched and not isnull(this_sigattrlog[12].utf8p1) and not isnull(this_sigattrlog[12].utf8p2) then
  l_0_2, l_0_3, l_0_4 = "regsvr32.exe", this_sigattrlog[12].utf8p1, this_sigattrlog[12].utf8p2
else
  return mp.CLEAN
end
local l_0_5 = string.lower(l_0_4)
local l_0_6 = string.gsub(l_0_5, "[\"%s]+", " ")
local l_0_7 = {
  "-encodedcommand",
  "-encoded ",
  " -enc ",
  "-enc ",
  "invoke-expression",
  "iex(",
  "iex ",
  " iex ",
  "downloadstring",
  "downloadfile",
  "downloaddata",
  "invoke-webrequest",
  " iwr ",
  "start-bitstransfer",
  "frombase64string",
  "::frombase64",
  "certutil -decode",
  "certutil.exe -decode",
  "-urlcache -f",
  "urlcache -f -split",
  "bitsadmin /transfer",
  "bitsadmin.exe /transfer",
  "reg add ",
  "reg delete ",
  "schtasks /create",
  "wmic process call create",
  " curl.exe ",
  " wget.exe ",
  " wget ",
  " curl "
}
if not contains(l_0_6, l_0_7, true) then
  return mp.CLEAN
end
local l_0_8 = IsTechniqueObservedGlobal("DurableTaintedIisInstance", true)
bm.add_related_string("dur_shell_child", l_0_2, bm.RelatedStringBMReport)
bm.add_related_string("dur_shell_child_path", string.lower(l_0_3), bm.RelatedStringBMReport)
bm.add_related_string("dur_shell_child_cmd", l_0_4, bm.RelatedStringBMReport)
bm.add_related_string("dur_shell_post_drop", tostring(l_0_8 or false), bm.RelatedStringBMReport)
bm.add_related_string("dur_shell_sp_ctx", tostring(IsSharepointServer()), bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1505.003", "iis_worker_shell_exec", 28800)
return mp.INFECTED
