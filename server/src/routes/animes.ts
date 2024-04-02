import express from "express";
import * as AnimeController from "../controllers/animes";
const router = express.Router();

router.get("/getAnimeBanner", AnimeController.getAnimeBanner);

router.get("/getAnimeAlbum", AnimeController.getAnimeAlbum);

router.post("/getAnimeInAlbum", AnimeController.getAnimeInAlbum);

router.get("/getNewEpisodeAnime", AnimeController.getNewEpisodeAnime);

router.get("/getRankingTable", AnimeController.getRankingTable);

router.get("/getTopViewAnime", AnimeController.getTopViewAnime);

router.post("/getAnimeChapterById", AnimeController.getAnimeChapterById);

router.post("/getAnimeDetailById", AnimeController.getAnimeDetailById);

router.get("/getSomeTopViewEpisodes", AnimeController.getSomeTopViewEpisodes);

router.post(
  "/getAnimeEpisodeDetailById",
  AnimeController.getAnimeEpisodeDetailById
);

router.post(
  "/getAnimeDetailInEpisodePageById",
  AnimeController.getAnimeDetailInEpisodePageById
);

router.post("/updateEpisodeView", AnimeController.updateEpisodeView);

router.post("/addUserLikeEpisode", AnimeController.addUserLikeEpisode);

router.post(
  "/checkUserHasLikeEpisode",
  AnimeController.checkUserHasLikeEpisode
);
export default router;
