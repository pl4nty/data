-- Threat: !InfrastructureShared
-- Name: 20ab340070c2f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 then
  l_0_0 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 then
  l_0_0 = this_sigattrlog[6].utf8p2
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 then
  l_0_0 = this_sigattrlog[7].utf8p2
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 then
  l_0_0 = this_sigattrlog[8].utf8p2
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 then
  l_0_0 = this_sigattrlog[9].utf8p2
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 then
  l_0_0 = this_sigattrlog[10].utf8p2
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p2 then
  l_0_0 = this_sigattrlog[11].utf8p2
elseif this_sigattrlog[12].matched and this_sigattrlog[12].utf8p2 then
  l_0_0 = this_sigattrlog[12].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0)
local l_0_2 = {
  "-encodedcommand",
  "-enc ",
  "downloadstring",
  "downloadfile",
  "invoke-webrequest",
  "invoke-expression",
  "new-object net.webclient",
  "-windowstyle hidden",
  "-w hidden",
  "-ep bypass",
  "-executionpolicy bypass",
  "start-bitstransfer",
  "certutil -urlcache",
  "certutil -decode",
  "regsvr32 /s /n /u /i:http",
  "mshta vbscript",
  "mshta javascript",
  "bitsadmin /transfer"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1059", "Execution")
add_parents()
return mp.INFECTED
