local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

local customRuleset(name) = 
  orgs.newRepoRuleset(name) {
    allows_updates: true,
    bypass_actors+: [
      "#Write"
    ],
    include_refs+: [
      std.format("refs/heads/%s", name),
    ],
    requires_pull_request: false,
    required_approving_review_count: null,
    required_status_checks+: [
      "CI status checks"
    ],
    requires_commit_signatures: false,
    requires_last_push_approval: false,
    requires_review_thread_resolution: false,
  };

local readTheDocsWebhookEvents = [
  "create",
  "delete",
  "push",
  "pull_request"
];

orgs.newOrg('eclipse-zenoh') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    name: "Eclipse zenoh",
    web_commit_signoff_required: false,
    workflows+: {
      default_workflow_permissions: "write",
    },
    default_branch_name: "main",
  },
  secrets+: [
    orgs.newOrgSecret('CRATES_IO_TOKEN') {
      value: "********",
    },
    orgs.newOrgSecret('DOCKER_COM_PASSWORD') {
      value: "********",
    },
    orgs.newOrgSecret('DOCKER_COM_USERNAME') {
      value: "********",
    },
    orgs.newOrgSecret('BOT_TOKEN_WORKFLOW') {
      value: "pass:/bots/iot.zenoh/github.com/api-token-workflow",
    },
    orgs.newOrgSecret('PYPI_ORG_TOKEN') {
      value: "********",
    },
    orgs.newOrgSecret('SSH_PASSPHRASE') {
      value: "********",
    },
    orgs.newOrgSecret('SSH_PRIVATE_KEY') {
      value: "********",
    },
  ],
  _repositories+:: [
    orgs.newRepo('homebrew-zenoh') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Homebrew tap for Eclipse zenoh formulae (MacOS)",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('roadmap') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      has_discussions: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "zenoh unifies data in motion, data in-use, data at rest and computations. It carefully blends traditional pub/sub with geo-distributed storages, queries and computations, while retaining a level of time and space efficiency that is well beyond any of the mainstream stacks.",
      homepage: "https://zenoh.io",
      topics+: [
        "distributed-computing",
        "distributed-storage",
        "distributed-systems",
        "edge-computing",
        "embedded",
        "geo-distributed-storages",
        "iot",
        "messaging",
        "network-programming",
        "networking",
        "protocol",
        "robotics",
        "ros2",
        "rust",
        "rust-lang",
        "storage",
        "zenoh"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      rulesets: [
        customRuleset("main"),
      ],
    },
    orgs.newRepo('zenoh-backend-filesystem') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Backend and Storages for zenoh using the file system",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      rulesets: [
        customRuleset("main"),
      ],
    },
    orgs.newRepo('zenoh-backend-influxdb') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Backend and Storages for zenoh using InfluxDB",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      rulesets: [
        customRuleset("main"),
      ],
    },
    orgs.newRepo('zenoh-backend-rocksdb') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Backend and Storages for zenoh using RocksDB",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      rulesets: [
        customRuleset("main"),
      ],
    },
    orgs.newRepo('zenoh-backend-s3') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Backend and Storages for Zenoh using AWS S3 API",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      rulesets: [
        customRuleset("main"),
      ],
    },
    orgs.newRepo('zenoh-backend-sql') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Backend and Storages for zenoh using an SQL database (SQLITE3, MySQL, PostgreSQL...)",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-c') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "C API for Zenoh",
      homepage: "http://zenoh.io",
      topics+: [
        "edge-computing",
        "iot",
        "messaging",
        "micro-controllers",
        "networking",
        "robotics",
        "ros2"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://readthedocs.org/api/v2/webhook/zenoh-c/263729/') {
          content_type: "json",
          events+: readTheDocsWebhookEvents,
          secret: "pass:bots/iot.zenoh/readthedocs.org/zenoh-c-webhook-secret"
        },
      ],
      rulesets: [
        customRuleset("main"),
      ],
    },
    orgs.newRepo('zenoh-cpp') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "C++ API for zenoh",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://readthedocs.org/api/v2/webhook/zenoh-cpp/263743/') {
          content_type: "json",
          events+: readTheDocsWebhookEvents,
          secret: "pass:bots/iot.zenoh/readthedocs.org/zenoh-cpp-webhook-secret"
        },
      ],
    },
    orgs.newRepo('zenoh-csharp') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "C# API for zenoh",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-demos') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Some demos using Eclipse zenoh",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-go') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Go-lang API for zenoh",
      homepage: "http://zenoh.io",
      topics+: [
        "edge-computing",
        "go",
        "golang",
        "iot",
        "zenoh"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-java') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Java APIs for zenoh",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      homepage: "http://zenoh.io",
      topics+: [
        "java",
        "scala",
        "zenoh"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages",
            "master"
          ],
          deployment_branch_policy: "selected",
        },
      ],
      rulesets: [
        customRuleset("main"),
      ],
    },
    orgs.newRepo('zenoh-kotlin') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_projects: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages",
            "main"
          ],
          deployment_branch_policy: "selected",
        },
      ],
      rulesets: [
        customRuleset("main"),
      ],
    },
    orgs.newRepo('zenoh-pico') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Eclipse zenoh for pico devices",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://readthedocs.org/api/v2/webhook/zenoh-pico/263750/') {
          content_type: "json",
          events+: readTheDocsWebhookEvents,
          secret: "pass:bots/iot.zenoh/readthedocs.org/zenoh-pico-webhook-secret"
        },
      ],
    },
    orgs.newRepo('zenoh-plugin-dds') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "A zenoh plug-in that allows to transparently route DDS data.  This plugin can be used by DDS applications, such as ROS2 robotic applications and others, to leverage the zenoh for geographical routing or for better scaling discovery.",
      homepage: "",
      topics+: [
        "cyclonedds",
        "dds",
        "edge-computing",
        "robotics",
        "ros2",
        "zenoh"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      rulesets: [
        customRuleset("main"),
      ],
    },
    orgs.newRepo('zenoh-plugin-mqtt') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "A Zenoh plug-in that allows to integrate and/or route MQTT pub/sub with Eclipse Zenoh.",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      rulesets: [
        customRuleset("main"),
      ],
    },
    orgs.newRepo('zenoh-plugin-ros1') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      rulesets: [
        customRuleset("main"),
      ],
    },
    orgs.newRepo('zenoh-plugin-ros2dds') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "A Zenoh plug-in for ROS2 with a DDS RMW.",
      homepage: "https://zenoh.io",
      topics+: [
        "cyclonedds",
        "dds",
        "edge-computing",
        "robotics",
        "ros2",
        "zenoh"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      rulesets: [
        customRuleset("main"),
      ],
    },
    orgs.newRepo('zenoh-plugin-webserver') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "A zenoh plug-in implementing an HTTP server mapping URLs to zenoh paths. This plugin can be used to set-up a Web server where the resources are retrieved from geo-distributed zenoh storages, each leveraging various backends (file system, database, memory...)",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      rulesets: [
        customRuleset("main"),
      ],
    },
    orgs.newRepo('zenoh-plugin-zenoh-flow') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "A Zenoh plug-in that allows to integrate a Zenoh Flow runtime within a Zenoh router.",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-python') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Python API for zenoh",
      homepage: "http://zenoh.io",
      topics+: [
        "edge-computing",
        "embedded",
        "iot",
        "python",
        "zenoh"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://readthedocs.org/api/v2/webhook/zenoh-python/263749/') {
          content_type: "json",
          events+: readTheDocsWebhookEvents,
          secret: "pass:bots/iot.zenoh/readthedocs.org/zenoh-python-webhook-secret"
        },
      ],
      rulesets: [
        customRuleset("main"),
      ],
    },
    orgs.newRepo('ci') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "GitHub Actions and workflows used across eclipse-zenoh",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('zenoh-ts') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "TypeScript Interface to the Zenoh Protocol.",
      homepage: "http://zenoh.io",
      topics+: [
        "typescript",
        "zenoh"
      ],
      web_commit_signoff_required: false,
    },
    orgs.newRepo('.github') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "A repository for default files (community health files, issue templates, etc)",
      web_commit_signoff_required: false,
    },
  ],
}
