-- Threat: !InfrastructureShared
-- Name: 2c3b377e4219c
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = {
  "^ntsvcs_?%x%x$",
  "^scerpc_?%x%x$",
  "^spoolss_%x%x$",
  "^rpc_%x%x$",
  "^msrpc_%x%x%x%x$",
  "^dsernamepipe%x%x$",
  "^searchtextharvester%x%x$",
  "^pgmessagepipe%x%x$",
  "^msftewds%x%x$",
  "^mypipe%-[fh]%x%x$",
  "^fullduplex_%x%x$",
  "^f4c3%x%x$",
  "^f53f%x%x$",
  "^windows%.update%.manager%x%x%x?$"
}

local function l_0_1(l_1_0)
  if l_1_0 == nil then
    return nil
  end
  return string.match(string.lower(l_1_0), "([^\\]+)$")
end

local l_0_2
for l_0_3 = 1, mp.SIGATTR_LOG_SZ do
  local l_0_4 = sigattr_head[l_0_3]
  if l_0_4.matched and l_0_4.attribute == 16560 then
    local l_0_5 = l_0_1(l_0_4.utf8p1)
    if contains(l_0_5, l_0_0, false) then
      l_0_2 = l_0_5
      break
    end
  end
end
if l_0_2 == nil then
  return mp.CLEAN
end
return mp.INFECTED
