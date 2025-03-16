## What is this?

Check this out: <https://ev2docs.azure.net/overview/intro.html>

## How is this used?

Through two release pipelines:

-   [deploy-infra-nonprod](https://domoreexp.visualstudio.com/Teamspace/_release?view=mine&_a=releases&definitionId=2082)
    deploys to non-prod

-   [deploy-infra-prod](https://domoreexp.visualstudio.com/Teamspace/_release?view=mine&_a=releases&definitionId=2083)
    deploys to prod

## Is there a workflow for making changes to this?

Yes:

1. Test the changes in non-prod
1. Once everything works, create a pull request
1. Once the pull request is completed, deploy to prod
