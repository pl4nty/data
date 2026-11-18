-- Threat: !InfrastructureShared
-- Name: 15d092f9f337
-- Type: 21

if mp.get_mpattribute("BM_OLE_FILE") then
  mp.set_mpattribute("SCRIPT:PDFinOLE")
  if mp.get_mpattribute("InEmail") then
    local l_0_0 = mp.getfilesize()
    if l_0_0 == nil or 1000000 < l_0_0 or l_0_0 < 1000 then
      return mp.CLEAN
    end
    local l_0_1 = mp.BMSearchFile(0, l_0_0, ".Document.DC\144\001@\144\002@h\000t\000t\000p\000:\000/\000/\144\000")
    if 0 < l_0_1 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
