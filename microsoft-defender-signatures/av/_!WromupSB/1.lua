-- Threat: \xac!Wromup.SB
-- Type: 24
-- MpAttributes: Lua:IOAVFirstLNKFileArgsMinInContainer

local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0 == "https://web.whatsapp.com/" then
  local l_0_1 = mp.getfilesize()
  if l_0_1 < 2000 then
    return mp.INFECTED
  end
end
return mp.CLEAN
