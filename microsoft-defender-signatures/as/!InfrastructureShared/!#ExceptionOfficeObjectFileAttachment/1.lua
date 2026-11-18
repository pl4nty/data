-- Threat: !InfrastructureShared
-- Name: !#Exception:OfficeObjectFileAttachment
-- Type: 13
-- MpAttributes: BM_LNK_FILE

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if string.find(l_0_0, "argus.pptx->ppt/embeddings/oleobject", 1, true) ~= nil or string.find(l_0_0, "conductor - sizing, single phase.pptx->ppt/embeddings/oleobject", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
