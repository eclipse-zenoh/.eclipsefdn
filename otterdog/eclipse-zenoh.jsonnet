local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-zenoh') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    members_can_change_project_visibility: false,
    name: "Eclipse zenoh",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      default_workflow_permissions: "write",
    },
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
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Homebrew tap for Eclipse zenoh formulae (MacOS)",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('roadmap') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      has_discussions: true,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "zenoh unifies data in motion, data in-use, data at rest and computations. It carefully blends traditional pub/sub with geo-distributed storages, queries and computations, while retaining a level of time and space efficiency that is well beyond any of the mainstream stacks.",
      homepage: "https://zenoh.io",
      secret_scanning_push_protection: "disabled",
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
    },
    orgs.newRepo('zenoh-backend-filesystem') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Backend and Storages for zenoh using the file system",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-backend-influxdb') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Backend and Storages for zenoh using InfluxDB",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-backend-rocksdb') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Backend and Storages for zenoh using RocksDB",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-backend-s3') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Backend and Storages for Zenoh using AWS S3 API",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-backend-sql') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Backend and Storages for zenoh using an SQL database (SQLITE3, MySQL, PostgreSQL...)",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-c') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "C API for Zenoh",
      homepage: "http://zenoh.io",
      secret_scanning_push_protection: "disabled",
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
        orgs.newRepoWebhook('https://readthedocs.org/api/v2/webhook/zenoh-c/135565/') {
          content_type: "json",
          events+: [
            "create",
            "delete",
            "push"
          ],
        },
      ],
    },
    orgs.newRepo('zenoh-cpp') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "C++ API for zenoh",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-csharp') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "C# API for zenoh",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-demos') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Some demos using Eclipse zenoh",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-flow') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "zenoh-flow aims at providing a zenoh-based data-flow programming framework for computations that span from the cloud to the device.",
      homepage: "",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "autonomous-vehicles",
        "data-science",
        "dataflow-programming",
        "machine-learning",
        "robotics",
        "ros2",
        "rust-lang"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-flow-python') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Zenoh Flow Python API",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-go') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Go-lang API for zenoh",
      homepage: "http://zenoh.io",
      secret_scanning_push_protection: "disabled",
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
      secrets: [
        orgs.newRepoSecret('DELETEME') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('zenoh-java') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Java APIs for zenoh",
      homepage: "http://zenoh.io",
      secret_scanning_push_protection: "disabled",
      topics+: [
        "java",
        "scala",
        "zenoh"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
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
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('zenoh-pico') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Eclipse zenoh for pico devices",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-plugin-dds') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "A zenoh plug-in that allows to transparently route DDS data.  This plugin can be used by DDS applications, such as ROS2 robotic applications and others, to leverage the zenoh for geographical routing or for better scaling discovery.",
      homepage: "",
      secret_scanning_push_protection: "disabled",
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
    },
    orgs.newRepo('zenoh-plugin-mqtt') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "A Zenoh plug-in that allows to integrate and/or route MQTT pub/sub with Eclipse Zenoh.",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-plugin-ros1') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-plugin-ros2dds') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "A Zenoh plug-in for ROS2 with a DDS RMW.",
      homepage: "https://zenoh.io",
      secret_scanning_push_protection: "disabled",
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
    },
    orgs.newRepo('zenoh-plugin-webserver') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "A zenoh plug-in implementing an HTTP server mapping URLs to zenoh paths. This plugin can be used to set-up a Web server where the resources are retrieved from geo-distributed zenoh storages, each leveraging various backends (file system, database, memory...)",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-plugin-zenoh-flow') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "A Zenoh plug-in that allows to integrate a Zenoh Flow runtime within a Zenoh router.",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('zenoh-python') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Python API for zenoh",
      homepage: "http://zenoh.io",
      secret_scanning_push_protection: "disabled",
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
        orgs.newRepoWebhook('https://readthedocs.org/api/v2/webhook/zenoh-python/135566/') {
          events+: [
            "push"
          ],
        },
      ],
    },
  ],
}
