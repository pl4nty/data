-- Threat: !InfrastructureShared
-- Name: !#SLF:InterestingAttachmentFileName
-- Type: 24
-- MpAttributes: //Lua:ContextFromWebmail | //Lua:ContextualDropFileByEmailClient

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE)) or ""
local l_0_1, l_0_2 = l_0_0:match("(.+)%.([^.]+)$")
if nil ~= l_0_2 and nil ~= l_0_1 then
  local l_0_3 = {
    doc = true,
    docm = true,
    xls = true,
    xlsm = true,
    pdf = true
  }
  if true == l_0_3[l_0_2] then
    local l_0_4 = {
      "untitled",
      "img",
      "receipt",
      "invoice",
      "steam",
      "min",
      "nuevo",
      "pic",
      "jpg",
      "inc",
      "crack",
      "files",
      "backup",
      "plugin",
      "setup",
      "pdf",
      "acc",
      "cracked",
      "dhl",
      "instr"
    }
    for l_0_5, l_0_6 in pairs(l_0_4) do
      if l_0_1:sub(l_0_6, 1, "true") then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
