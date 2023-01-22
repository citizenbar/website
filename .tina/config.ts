import { defineConfig } from "tinacms";

// Your hosting provider likely exposes this as an environment variable
const branch = process.env.HEAD || process.env.VERCEL_GIT_COMMIT_REF || "main";

export default defineConfig({
  branch,
  clientId: "6d053416-1b4c-4f8b-9bb6-c87296286f87", // Get this from tina.io
  token: "00eed11d1cb52af53f8e90cd5d03babec6e5f1e2", // Get this from tina.io
  build: {
    outputFolder: "admin",
    publicFolder: "static",
  },
  media: {
    tina: {
      mediaRoot: "",
      publicFolder: "static",
    },
  },
  schema: {
    collections: [
      {
        label: "Events (FR)",
        name: "events__fr_",
        path: "content/french/events",
        format: 'md',
        fields: [
          // {
          //   label: "Image Gallery",
          //   name: "gallery",
          //   type: "object",
          //   list: true,
          //   fields: [
          //     { 
          //       label: "Image", 
          //       name: "image", 
          //       type: "image" 
          //     },
          //   ],
          // },
          { name: "cover", label: "cover", type: "image",},
          { name: "date", label: "date", type: "datetime",},
          { name: "title", label: "title", type: "string",},
          { name: "description", label: "description", type: "string",},
          { name: "watch", label: "Peertube video ID", type: "string",},
          { name: "featured", label: "Display on Homepage ?", type: "boolean",},
          { name: "draft", label: "Draft ?", type: "boolean",},
          { name: "body", label: "Body of Document", type: "rich-text", description: "This is the markdown body", isBody: true,},
        ],
      },
      {
        label: "All Page (fr)",
        name: "all_page__fr_",
        path: "content/french",
        format: 'md',
        fields: [
          {
            type: "rich-text",
            name: "body",
            label: "Body of Document",
            description: "This is the markdown body",
            isBody: true,
          },
        ],
      },
      {
        label: "i18n",
        name: "i18n",
        path: "i18n",
        format: 'md',
        fields: [
          {
            type: "rich-text",
            name: "body",
            label: "Body of Document",
            description: "This is the markdown body",
            isBody: true,
          },
        ],
      },
    ],
  },
});
