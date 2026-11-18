-- Threat: !InfrastructureShared
-- Name: !#Lua:OneNoteUnpacker
-- Type: 12
-- MpAttributes: RPF:TopLevelFile & BM_ONENOTE_FILE

local l_0_0 = mp.getfilesize()
local l_0_1 = ""
local l_0_2 = {}
if 5120000 < l_0_0 then
  return mp.CLEAN
end
local l_0_3 = {
  pe = "\231\022\227\189e&\017E\164\196\141M\vz\158\172\144\001\020MZ\144\000",
  lnk = "\231\022\227\189e&\017E\164\196\141M\vz\158\172\144\001\020L\000\000\000\144\000",
  script = "\231\022\227\189e&\017E\164\196\141M\vz\158\172\144\002\255\144\023\n\b\b\006\006\006\006\n\004\016\016On Erroron errorScriptscriptSCRIPT<html>powershell#@~^<HTA:APPLICATION<hta:application\144\000",
  bat = "\231\022\227\189e&\017E\164\196\141M\vz\158\172\144\001\020\144\023\002\005\005@echo@ECHO\144\000",
  chm = "\231\022\227\189e&\017E\164\196\141M\vz\158\172\144\001\020ITSF\144\000"
}
for l_0_4, l_0_5 in next, l_0_3, nil do
  local l_0_6, l_0_7 = pcall(mp.BMSearchFile, 0, l_0_0, l_0_5)
  if l_0_6 and l_0_7 ~= -1 then
    mp.set_mpattribute("//Lua:OneNoteFileData")
    mp.readprotection(false)
    local l_0_8 = 36
    if l_0_0 > l_0_7 + l_0_8 then
      local l_0_9 = mp.readfile(l_0_7, l_0_8)
      local l_0_10 = mp.readu_u64(l_0_9, 17)
      if l_0_0 > l_0_7 + l_0_8 + l_0_10 then
        local l_0_11 = mp.readfile(l_0_7 + l_0_8, l_0_10)
        mp.readprotection(true)
        local l_0_12 = crypto.Sha1Buffer(l_0_11, 0, #l_0_11)
        if not l_0_2[l_0_12] then
          l_0_2[l_0_12] = true
          if l_0_4 == "pe" then
            l_0_1 = "PE"
            mp.set_mpattribute("//Lua:OneNoteFileDataPE")
          elseif l_0_4 == "bat" then
            l_0_1 = "BAT"
            mp.set_mpattribute("//Lua:OneNoteFileDataBAT")
          elseif l_0_4 == "script" then
            l_0_1 = "SCRIPT"
            mp.set_mpattribute("//Lua:OneNoteFileDataSCRIPT")
          elseif l_0_4 == "chm" then
            l_0_1 = "CHM"
            mp.set_mpattribute("//Lua:OneNoteFileDataCHM")
          elseif l_0_4 == "lnk" then
            l_0_1 = "LNK"
            mp.set_mpattribute("//Lua:OneNoteFileDataLNK")
          end
          mp.vfo_add_buffer(l_0_11, "[ONENOTE_FILEDATA_" .. l_0_1 .. "]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
        end
      end
    end
  end
end
return mp.CLEAN
