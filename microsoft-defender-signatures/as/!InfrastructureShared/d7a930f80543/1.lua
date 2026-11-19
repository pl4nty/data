-- Threat: !InfrastructureShared
-- Name: d7a930f80543
-- Type: 21

function string.fromhex(l_1_0)
  return (l_1_0:gsub("..", function(l_2_0)
    return string.char(tonumber(l_2_0, 16))
  end))
end

local l_0_0 = string.lower(nri.GetURI())
if l_0_0 then
  local l_0_1 = string.match(l_0_0, "^http://canonicalizer.ucsuri.tcs/(%w%w+)$")
  l_0_1 = string.gsub(l_0_1, "00", "")
  l_0_1 = l_0_1:fromhex()
  l_0_1 = string.match(l_0_1, "^%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?:%d%d%d+/(.*)$")
  if l_0_1 and string.len(l_0_1) > 24 and string.find(l_0_1, "^[%w/_%-=]+$") and nri.GetHttpCommand() == nri.HTTP_GET and nri.GetHttpResponseHeader("Server") == "Apache" and nri.GetHttpResponseHeader("Content-Type") == "application/octet-stream" then
    local l_0_2 = tonumber(nri.GetHttpResponseHeader("Content-Length"))
    if l_0_2 and 160000 < l_0_2 and l_0_2 < 220000 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
