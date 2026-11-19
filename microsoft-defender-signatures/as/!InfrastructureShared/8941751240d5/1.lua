-- Threat: !InfrastructureShared
-- Name: 8941751240d5
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = tonumber(nri.GetHttpResponseHeader("Content-Length"))
if 15000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = nri.GetRawResponseBlob()
if l_0_1 ~= nil then
  local l_0_2 = {
    "exec",
    "exploit",
    "binary",
    "start"
  }
  if contains(l_0_1, l_0_2) then
    local l_0_3 = {
      "wget",
      "curl",
      "powershell",
      "bash",
      "certutil",
      "cmd",
      "mshta",
      "python",
      "bitsadmin"
    }
    if contains(l_0_1, l_0_3) then
      reportHeaders({"Host", "User-Agent"})
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
