-- Threat: !InfrastructureShared
-- Name: 22ab3144e9184
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = 5
local l_0_1 = 20
local l_0_2 = mp.SIGATTR_LOG_SZ
local l_0_3 = {}
local l_0_4 = {}
local l_0_5 = 0
local l_0_6 = {
  [".txt"] = true,
  [".html"] = true,
  [".hta"] = true
}
for l_0_7 = l_0_2, 1, -1 do
  if sigattr_tail[l_0_7].attribute == 16384 and sigattr_tail[l_0_7].utf8p1:byte(1) ~= 37 then
    local l_0_8 = sigattr_tail[l_0_7].utf8p1:lower()
    local l_0_9 = l_0_8:match("[^\\]+$")
    if not isnull(l_0_9) then
      local l_0_10 = l_0_9:match("%.[^%.]+$")
      if not isnull(l_0_10) and l_0_6[l_0_10] == true then
        if l_0_3[l_0_9] ~= nil then
          table.insert(l_0_3[l_0_9], l_0_8)
        else
          l_0_3[l_0_9] = {l_0_8}
        end
        if l_0_0 <= #l_0_3[l_0_9] then
          local l_0_11 = {}
          for l_0_12 = 1, #l_0_3[l_0_9] do
            local l_0_13 = sysio.GetFileSize(l_0_3[l_0_9][l_0_12])
            if l_0_13 < 400 or 8000 < l_0_13 then
              l_0_3[l_0_9] = nil
              break
            end
            if l_0_4[l_0_3[l_0_9][l_0_12]] ~= nil then
              break
            else
              l_0_4[l_0_3[l_0_9][l_0_12]] = true
            end
            if l_0_11[l_0_13] ~= nil then
              l_0_11[l_0_13] = l_0_11[l_0_13] + 1
            else
              l_0_11[l_0_13] = 1
            end
            if l_0_11[l_0_13] == #l_0_3[l_0_9] then
              local l_0_14 = bm.get_current_process_startup_info()
              local l_0_15 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
              local l_0_16 = ""
              if l_0_14 ~= nil then
                l_0_16 = l_0_14.command_line
              else
                l_0_14 = -1
              end
              local l_0_17 = {cur_image_path = l_0_15, cmd_line = l_0_16}
              local l_0_18 = {}
              l_0_18.file_size = l_0_13
              l_0_18.file_paths = l_0_3[l_0_9]
              l_0_18.proc_meta_info = l_0_17
              local l_0_19 = safeJsonSerialize(l_0_18)
              bm.add_related_string("gen_ransom_note", l_0_19, bm.RelatedStringBMReport)
              sms_untrusted_process()
              return mp.INFECTED
            end
          end
        end
        l_0_5 = l_0_5 + 1
      end
    end
  end
end
if l_0_1 < l_0_5 then
  bm.trigger_sig("Exclude", "NoRansomDrop")
end
return mp.CLEAN
